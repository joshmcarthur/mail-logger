class Mail::Logger::Logfile < ::Logger
  def initialize
    path = Mail::Logger.configuration.log_path
    filename =  Mail::Logger.configuration.log_file_name
    logfile = File.open(File.join(path, filename), 'a+')
    logfile.sync = true
    super(logfile)
  end
end
