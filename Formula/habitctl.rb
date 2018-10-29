class Habitctl < Formula
  desc "habitctl"
  homepage "https://github.com/blinry/habitctl"
  url "https://github.com/blinry/habitctl/archive/0.1.0.tar.gz"
  sha256 "1143d336d2c076fce811199beec7bae5817727a11174a00a2414610d35eff3c2"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix,
                               "--path", "."
  end

  test do
    system "true"
  end

end
