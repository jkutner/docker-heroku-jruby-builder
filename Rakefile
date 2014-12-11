desc "Generate new jruby shell scripts"
task :new, [:version, :stack] do |t, args|
  ["1.8.7", "1.9.3", "2.0.0"].each do |ruby_version|
    file = "rubies/ruby-#{ruby_version}-jruby-#{args[:version]}.sh"
    puts "Writing #{file}"
    File.open(file, 'w') do |file|
      file.puts <<FILE
#!/bin/sh

docker run -v `pwd`/builds:/tmp/output -v `pwd`/../cache:/tmp/cache -e VERSION=#{args[:version]} -e RUBY_VERSION=#{ruby_version} -t hone/jruby-builder:#{args[:stack]}
FILE
    end
  end
end

desc "Upload a ruby to S3"
task :upload, [:version, :ruby_version, :stack] do |t, args|
  require 'aws-sdk'
  
  file        = "ruby-#{args[:ruby_version]}-jruby-#{args[:version]}.tgz"
  s3_key      = "#{args[:stack]}/#{file}"
  bucket_name = "heroku-buildpack-ruby"
  s3          = AWS::S3.new
  bucket      = s3.buckets[bucket_name]
  object      = bucket.objects[s3_key]

  puts "Uploading builds/#{file} to s3://#{bucket_name}/#{s3_key}"
  object.write(file: "builds/#{file}")
  object.acl = :public_read
end
