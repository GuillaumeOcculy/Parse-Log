require_relative "../lib/log_reader"

describe LogReader do

  let(:file) { File.read('spec/log.rb')}
  let(:log_reader) { described_class.new(file)}

  before(:each) do
    log_reader.save_logs
  end

  describe '#display_url_by_visits' do
    it "returns urls order by visits" do
      expect(log_reader.order_visits).to eq([["/about/2", 3], ["/help_page/1", 2], ["/contact", 1], ["/home", 1]])
    end
  end

  describe '#display_url_by_visits_with_unique_views' do
    it "returns urls order by visits with unique views" do
      expect(log_reader.order_unique).to eq([["/help_page/1", 2], ["/contact", 1], ["/home", 1], ["/about/2", 1]])
    end
  end

end
