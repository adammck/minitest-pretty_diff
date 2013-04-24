Gem::Specification.new do |s|
  s.name        = "minitest-pretty_diff"
  s.version     = 0.1

  s.authors     = ["Adam Mckaig"]
  s.email       = ["adam.mckaig@gmail.com"]
  s.homepage    = "https://github.com/adammck/minitest-pretty_diff"
  s.summary     = "Pretty-print hashes and arrays before diffing them in MiniTest"

  s.files         = Dir.glob("lib/**/*")
  s.test_files    = Dir.glob("test/**/*")
  s.require_paths = ["lib"]
end
