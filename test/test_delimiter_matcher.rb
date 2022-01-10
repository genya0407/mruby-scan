assert 'DelimiterMatcher#match / when specified delimiter, it returns hash-lik object that holds number' do
  matcher = Scan::DelimiterMatcher.new(delimiter: ':')
  assert_equal(matcher.match('aaa:bbb:ccc')[1], 'aaa')
  assert_equal(matcher.match('aaa:bbb:ccc')[0], 'aaa:bbb:ccc')
end
