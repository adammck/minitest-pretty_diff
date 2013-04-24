# minitest-pretty_diff

Monkey-patches `MiniTest::Assertions#mu_pp` to pretty-print hashes and arrays
before diffing them. This makes it much easier to spot the differences between
nested structures.


## Usage

Just require the gem, and use MiniTest's assertions like before.


## Before

    MiniTest::Assertion
    --- expected
    +++ actual
    @@ -1 +1 @@
    -{"widget"=>{"debug"=>"on", "window"=>{"title"=>"Sample Konfabulator W
    idget", "name"=>"main_window", "width"=>500, "height"=>500}, "image"=>{"src"=>"I
    mages/Sun.png", "name"=>"sun1", "hOffset"=>250, "vOffset"=>250, "alignment"=>"ce
    nter"}, "text"=>{"data"=>"Click Here", "size"=>36, "style"=>"bold", "name"=>"tex
    t1", "hOffset"=>250, "vOffset"=>100, "alignment"=>"center", "onMouseUp"=>"sun1.o
    pacity = (sun1.opacity / 100) * 90;"}}}
    +{"widget"=>{"debug"=>"on", "window"=>{"title"=>"Sample Konfabulator W
    idget", "name"=>"main_window", "width"=>500, "height"=>nil}, "image"=>{"src"=>"I
    mages/Sun.png", "name"=>"sun1", "hOffset"=>250, "vOffset"=>250, "alignment"=>"le
    ft"}, "text"=>{"data"=>"Click Here", "size"=>36, "style"=>"bold", "name"=>"text1
    ", "hOffset"=>250, "vOffset"=>100, "alignment"=>"center", "onMouseUp"=>"sun1.opa
    city = (sun1.opacity / 100) * 90;"}}}


## After

    MiniTest::Assertion
    --- expected
    +++ actual
    @@ -2,7 +2,7 @@
       "widget": {
         "debug": "on",
         "image": {
    -      "alignment": "center",
    +      "alignment": "left",
           "hOffset": 250,
           "name": "sun1",
           "src": "Images/Sun.png",
    @@ -19,7 +19,7 @@
           "vOffset": 100
         },
         "window": {
    -      "height": 500,
    +      "height": null,
           "name": "main_window",
           "title": "Sample Konfabulator Widget",
           "width": 500


## Installation

```sh
gem install minitest-pretty_diff # duh
```


## Rails

```ruby
group :test do
  gem "minitest-pretty_diff"
end
```


## Requirements

This thing requires Ruby 1.9.2 or higher, because it uses the `JSON` module to
pretty-print things. The `PP` class is available in older versions, but the
output isn't as readable.


## License

[minitest-pretty_diff] [repo] is free software, available under
[the MIT license] [license].




[repo]: https://raw.github.com/adammck/minitest-pretty_diff
[license]: https://raw.github.com/adammck/minitest-pretty_diff/master/LICENSE
