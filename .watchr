def run_test(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end
  puts Time.now.inspect
  puts "Running #{file}"
  system "testdrb #{file}"
  puts
end

watch("test/.*/*_test.rb") do |match|
  run_test match[0]
end

watch("app/(.*)/(.*).rb") do |match| 
  if match[1] == "controllers"
	  run_test %{test/functional/#{match[2]}_test.rb}
  elsif match[1] == "models"
  	run_test %{test/unit/#{match[2]}_test.rb}
 end
end