describe Fastlane::Actions::FeishuBotAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The feishu_bot plugin is working!")

      Fastlane::Actions::FeishuBotAction.run(nil)
    end
  end
end
