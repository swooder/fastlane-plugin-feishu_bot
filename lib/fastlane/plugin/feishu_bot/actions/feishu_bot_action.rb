require 'fastlane/action'
require_relative '../helper/feishu_bot_helper'

module Fastlane
  module Actions
    class FeishuBotAction < Action
      def self.run(params)
        UI.message("The feishu_bot plugin is working!")
        UI.message "Api token: #{params[:api_token]}"
        UI.message "Notification title: #{params[:title]}"
        UI.message "Notification content: #{params[:content]}"
        self.post_to_feishu(params[:api_token], params[:title], params[:content])
      end

      def self.post_to_feishu(token, title, content)
        require 'uri'
        require 'json'
        require 'net/http'
        uri = URI.parse("https://open.feishu.cn/open-apis/bot/hook/#{token}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.to_s, 'Content-Type' => 'application/json')
        request.body = {title: title, text: content}.to_json
        response = http.request(request)
        UI.message "Api token: #{uri}"
        self.check_response(response)
      end

      def self.check_response(response)
        case response.code.to_i
        when 200, 204
          true
        else
          UI.user_error!("Could not sent Feishu notification, code: #{response.code.to_i}")
        end
      end

      def self.description
        "A fastlane plugin to customize your automation workflow(s) with a Feishu Bot"
      end

      def self.authors
        ["cook"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "A fastlane plugin to customize your automation workflow(s) with a Feishu Bot"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "FEISHU_BOT_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
