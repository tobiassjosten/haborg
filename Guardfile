guard :shell do
  watch(%r{^src/.+}) do |m|
    #`make`
    `runghc #{m[0]}`
  end
end

# vim:ft=ruby
