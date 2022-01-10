##
## Scan Test
##

assert("Scan#hello") do
  t = Scan.new "hello"
  assert_equal("hello", t.hello)
end

assert("Scan#bye") do
  t = Scan.new "hello"
  assert_equal("hello bye", t.bye)
end

assert("Scan.hi") do
  assert_equal("hi!!", Scan.hi)
end
