def spec
  system "clear && date && rspec --color spec.rb"
end

watch('.*\.rb') { |md| spec }

watch('Gemfile') do
  system "bundle"
end

