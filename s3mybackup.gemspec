# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','s3mybackup','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 's3mybackup'
  s.version = S3mybackup::VERSION
  s.author = 'Joris Wijlens'
  s.email = 'joris@smartworkx.com'
  s.homepage = 'https://github.com/joris77/s3backup'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Command suite for backing up MySQL databases to S3'
  s.description = <<-EOF
    Options can be configured in a file config.yml located in the directory from where command is executed.
  EOF
# Add your other files here if you make them
  s.files = %w(
bin/s3mybackup
lib/s3mybackup/version.rb
lib/s3mybackup.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','s3mybackup.rdoc']
  s.rdoc_options << '--title' << 's3mybackup' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 's3mybackup'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.5.3')
  s.add_runtime_dependency('aws-sdk','1.7.1')
end
