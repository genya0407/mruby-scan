assert "Format#render / when template string is specified, it renders template with params" do
  format = Scan::Format.new('{1}:{2}')
  assert_equal(
    format.render(1 => 'aaa', 2 => 'bbb'),
    'aaa:bbb'
  )
end

assert "Format#render / when capture is duplicated, it renders template with params" do
  format = Scan::Format.new('{1}:{2}:{1}')
  assert_equal(
    format.render(1 => 'aaa', 2 => 'bbb'),
    'aaa:bbb:aaa'
  )
end

assert "Format#render / when capture name is string, it renders template with params" do
  format = Scan::Format.new('{xxx}:{2}:{1}')
  assert_equal(
    format.render('xxx' => 'hogehoge', 1 => 'aaa', 2 => 'bbb'),
    'hogehoge:bbb:aaa'
  )
end
