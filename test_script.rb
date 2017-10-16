#!/usr/bin/env ruby

STDERR_FILE = 'tmp/err.txt'.freeze
STDOUT_FILE = 'tmp/out.txt'.freeze

def set_std
  @original_stdout = $stdout.dup
  @original_stderr = $stderr.dup
  $stdout.reopen(STDOUT_FILE, 'w')
  $stderr.reopen(STDERR_FILE, 'w')
end

def set_original_std
  $stdout.reopen(@original_stdout)
  $stderr.reopen(@original_stderr)
end

def remove_tmp
  File.delete(STDOUT_FILE) if File.exist?(STDOUT_FILE)
  File.delete(STDERR_FILE) if File.exist?(STDERR_FILE)
end

def check(file, text)
  file.readlines.any? { |line| line.include? text }
end

def test_file
  puts 'Testing start'
  remove_tmp
  set_std
  system 'cat spec/test.txt | ./nmax 10'
  set_original_std
  stdout_file = File.open(STDOUT_FILE, 'r')
  unless check(stdout_file, 'DONE')
    return puts "Script stdout not contains expected elements. Check #{STDOUT_FILE}"
  end
  unless File.zero?(STDERR_FILE)
    return puts "Script not done. You can see errors in #{STDERR_FILE}"
  end
  puts 'Script work correctly'
end

test_file
