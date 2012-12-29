def run_system(command)
  result = system(command)
  raise("error, process exited with status #{$?.exitstatus}") unless result
end

def execute_sql(sql,user,password)
  cmd = "mysql -u #{user} -e \"#{sql}\""
  cmd += " -p'#{password}' " unless password.nil?
  run_system cmd
end

def get_bucket(global_options)
  s3 = AWS::S3.new

  bucket_name = global_options[:bucket]
  bucket = s3.buckets[bucket_name]

  if not bucket.exists? then
    bucket = s3.buckets.create(bucket_name)
  end
  bucket
end

def get_ip
  IPSocket.getaddress(Socket.gethostname).gsub!(/\./, "")
end

def get_database_dir(database,ip = get_ip)

  database_dir = "#{ip}/#{database}"
end

def get_full_backup_file_name(time_string = (Time.now).strftime('%Y%m%d%H%M%S'))
  "#{time_string}dump.sql.gz"
end



def retrieve_file(bucket,database_dir,file_name)

  full_dump = bucket.objects["#{database_dir}/#{file_name}"]

  File.open("#{@temp_dir}/#{file_name}", 'w') do |f|
    full_dump.read do |chunk|
      f.write(chunk)
    end
  end
end
