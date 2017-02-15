class LogReader

  def initialize(file)
    @file = file
    @logs = []
  end

  def save_logs
    @file.each_line do |f|
      url, ip = f.split
      @logs << { url: url, ip: ip }
    end
  end

  def display_urls
    @display_urls = @logs.group_by { |log| log[:url] }
  end

  def order_visits
    display_urls.map { |url, log| [url, log.count] }.sort { |x,y| y.last <=> x.last }
  end

  def order_unique
    display_urls.map { |url, log| [url, log.uniq.count] }.sort { |x,y| y.last <=> x.last }
  end

  def display_url_by_visits
    order_visits.each do |url, log_count|
      puts "#{url} #{log_count} visits"
    end
  end

  def display_url_by_visits_with_unique_views
    order_unique.each do |url, log_count|
      puts "#{url} #{log_count} unique views"
    end
  end

end
