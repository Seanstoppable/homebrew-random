cask 'bitbar' do
  version '2.0.0-beta10'
  sha256 '69731c6686e0f2ccc2a3f19dd4e98cca7244e5a859d5326c627875a20220cea5'

  url "https://github.com/matryer/bitbar/releases/download/v#{version}/BitBar-v#{version}.zip"
  appcast 'https://github.com/matryer/bitbar/releases.atom',
          checkpoint: '983fa180d4b2708f1c9e7890886446c3ff4792c32b5b3ad9adbe5011f0ea5131'
  name 'BitBar'
  homepage 'https://github.com/matryer/bitbar/'

  app 'BitBar.app'
end
