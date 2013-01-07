require 'formula'
class ArmNoneEabiBinutils < Formula
  url 'http://ftpmirror.gnu.org/binutils/binutils-2.23.1.tar.bz2'
  mirror 'http://ftp.gnu.org/gun/binutils/binutils-2.23.1.tar.bz2'
  homepage 'http://www.gnu.org/software/binutils/binutils.html'
  sha1 '587fca86f6c85949576f4536a90a3c76ffc1a3e1'

  def install
    target = "arm-none-eabi"

    args = ["--target=#{target}",
            "--prefix=#{prefix}",
            "--infodir=#{info}",
            "--mandir=#{man}",
            "--enable-multilib",
            "--with-gnu-as",
            "--with-gnu-ld",
            "--disable-werror",
            "--disable-nls"]

    mkdir 'build' do
        system "../configure", *args

        system "make"
        system "make install"
  end
end