require File.expand_path("../../lib/minitest/pretty_diff", __FILE__)

class Whatever
  include MiniTest::Assertions
end

$array = %Q([
  "Alpha",
  "Beta"
])

$hash = %Q({
  "Alpha": 1,
  "Beta": 2
})

$nested = %Q({
  "Alpha": [
    "Beta",
    {
      "Gamma": "Epsilon"
    }
  ]
})

describe "MiniTest::Assertions#mu_pp" do
  def mu_pp(*args)
    (@w ||= Whatever.new).mu_pp(*args)
  end

  it "has no effect on bools" do
    assert_equal "true", mu_pp(true)
    assert_equal "false", mu_pp(false)
  end

  it "has no effect on strings" do
    assert_equal '"Whatever"', mu_pp("Whatever")
  end

  it "pretty-prints arrays" do
    assert_equal $array, mu_pp(%w[Alpha Beta])
  end

  it "pretty-prints hashes" do
    assert_equal $hash, mu_pp({ "Alpha" => 1, "Beta" => 2 })
  end

  it "pretty-prints recursive structures" do
    assert_equal $nested, mu_pp({ "Alpha" => ["Beta", { "Gamma" => "Epsilon" }]})
  end
end
