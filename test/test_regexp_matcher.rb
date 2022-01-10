assert "RegexpMatcher#match / when specified named capture, it returns hash-like object that holds name" do
  matcher = Scan::RegexpMatcher.new(regexp: '(?<name>\d+)aaa')
  assert_equal(matcher.match('1000aaa')['name'], '1000')
end

assert "RegexpMatcher#match / when specified numbered capture, it returns hash-like object that holds number" do
  matcher = Scan::RegexpMatcher.new(regexp: '(\d+)aaa')
  assert_equal(matcher.match('1000aaa')[1], '1000')
  assert_equal(matcher.match('1000aaa')[0], '1000aaa')
end
