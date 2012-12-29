# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','s3backup','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 's3backup'
  s.version = S3backup::VERSION
  s.author = 'Joris Wijelns'
  s.email = 'joris@smartworkx.com'
  s.homepage = 'www.smartworkx.nl'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Command suite for backing up MySQL databases to S3'
# Add your other files here if you make them
  s.files = %w(
bin/s3backup
lib/s3backup/version.rb
lib/s3backup.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','s3backup.rdoc']
  s.rdoc_options << '--title' << 's3backup' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 's3backup'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.5.3')
end
