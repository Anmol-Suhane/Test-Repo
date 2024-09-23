class Object_Model
  def initialize
    $driver = @driver
  end

  def wait
    $wait = @wait
    @wait = Selenium::WebDriver::Wait. new(timeout: 10)
  end
end



