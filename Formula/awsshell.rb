class Awsshell < Formula
  desc "AWS Shell"
  homepage "https://github.com/awslabs/aws-shell"
  url "https://github.com/awslabs/aws-shell/archive/0.0.1.tar.gz"
  sha256 "6b4f78843af3a61dd0ba44cd701f36718ca8bd5ac66bdc692740685853968e0b"

  depends_on "awscli"

  bottle do
    cellar :any_skip_relocation
    sha256 "71a1c523398158e63656fa7fcd61e5735350abc4bcdcbe0fa5320ef857ce9623" => :el_capitan
  end

  resource "aws-cli" do
    url "https://pypi.python.org/packages/source/a/awscli/awscli-1.9.15.tar.gz"
    sha256 "21ce3edd76d8ad6ebb6edab212f7b0fb501f75f13236f931bab5bad6976484fa"
  end

  resource "botocore" do
    url "https://pypi.python.org/packages/source/b/botocore/botocore-1.3.15.tar.gz"
    sha256 "7cc7e9c03d1c15550c71806bc0fb41ee7291b4051d5ca6b7d93d15891bac04ea"
  end

  resource "boto3" do
    url "https://pypi.python.org/packages/source/b/boto3/boto3-1.2.3.tar.gz"
    sha256 "091206847d296520e5ec57706a5e4b428d017352eb3168c6bcb9a1ac9feab224"
  end

  resource "colorama" do
    url "https://pypi.python.org/packages/source/c/colorama/colorama-0.3.3.tar.gz"
    sha256 "eb21f2ba718fbf357afdfdf6f641ab393901c7ca8d9f37edd0bee4806ffa269c"
  end

  resource "configobj" do
    url "https://pypi.python.org/packages/source/c/configobj/configobj-5.0.6.tar.gz"
    sha256 "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
  end

  resource "docutils" do
    url "https://pypi.python.org/packages/source/d/docutils/docutils-0.12.tar.gz"
    sha256 "c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa"
  end

  resource "futures" do
    url "https://pypi.python.org/packages/source/f/futures/futures-3.0.3.tar.gz"
    sha256 "2fe2342bb4fe8b8e217f0d21b5921cbe5408bf966d9f92025e707e881b198bed"
  end

  resource "prompt-toolkit" do
    url "https://pypi.python.org/packages/source/p/prompt_toolkit/prompt_toolkit-0.52.tar.gz"
    sha256 "35b8a34df8dea4cba92222dc1b8700c30ed7a8ba47cf3bc583768c5571a30902"
  end

  resource "pygments" do
    url "https://pypi.python.org/packages/source/P/Pygments/Pygments-2.0.2.tar.gz"
    sha256 "7320919084e6dac8f4540638a46447a3bd730fca172afc17d2c03eed22cf4f51"
  end

  resource "python-dateutil" do
    url "https://pypi.python.org/packages/source/p/python-dateutil/python-dateutil-2.4.2.tar.gz"
    sha256 "3e95445c1db500a344079a47b171c45ef18f57d188dffdb0e4165c71bea8eb3d"
  end

  resource "six" do
    url "https://pypi.python.org/packages/source/s/six/six-1.9.0.tar.gz"
    sha256 "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5"
  end

  resource "wc-width" do
    url "https://pypi.python.org/packages/source/w/wcwidth/wcwidth-0.1.5.tar.gz"
    sha256 "66c7ce3199c87833aaaa1fe1241b63261ce53c1062597c189a16a54713e0919d"
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
