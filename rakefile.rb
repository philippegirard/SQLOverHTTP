require 'rake/testtask'

# https://mallibone.wordpress.com/2012/02/14/run-your-tests-with-a-single-command/

Rake::TestTask.new do |t|
  t.libs = ["app"]
  t.warning = true
  t.test_files = FileList['test/*_test.rb']
end