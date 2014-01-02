class DotFiles

  def self.install!
    files.each do |file_name|
      origin_path = File.expand_path(file_name)
      destination_path = File.expand_path("~/#{file_name}")
      if exists?(destination_path)
        puts "- #{destination_path} (exists)"
      else
        File.symlink(origin_path, destination_path)
        puts "- #{destination_path}"
      end
    end
  end

private

  def self.files
    files = Dir.glob('*',File::FNM_DOTMATCH)
    files = files.reject { |file_name| skip_file?(file_name) }
    files.reject { |file_name| !exists?(file_name) }
  end

  def self.exists?(file_name)
    File.exists?(file_name) || File.symlink?(file_name)
  end

  def self.skip_file?(file_name)
    extenstion = File.extname(file_name)
    ignored_file = %w{README.md Rakefile . .. .git bin}.include?(file_name)
    ignored_extension = %{.md .swp}.include?(extenstion) if extenstion != ""
    ignored_file || ignored_extension
  end
end

desc "install dotfiles"
task :install do
  DotFiles.install!
end
