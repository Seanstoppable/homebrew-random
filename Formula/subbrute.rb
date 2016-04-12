class Subbrute < Formula
  desc "Subbrute"
  homepage "https://github.com/TheRook/subbrute"
  head "https://github.com/ALSchwalm/subbrute.git", :revision => '3581cf294ef3217f9402c43482c216f94c437964'

  resource "dnslib" do
    url "https://pypi.python.org/packages/source/d/dnslib/dnslib-0.9.6.tar.gz"
    sha256 "6ba31ae2014644901a301727cc4e22844eb19295a959c362568f08aee9b3bfa8"
  end

  def install
    ENV["PYTHONPATH"] = libexec/"lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"

    resources.each do |r|
      r.stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "true"
  end
end


