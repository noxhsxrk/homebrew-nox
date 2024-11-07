class AiPreCommit < Formula
    desc "A description of your project"
    homepage "https://github.com/noxhsxrk/ai-pre-commit"
    url "https://github.com/noxhsxrk/ai-pre-commit/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "ec7ef4b9871458b6f917bbc395727d4c2197f4b042eae3e43e5a26de6f1aa88d"
    license "MIT"
  
    depends_on "python@3.9"
  
    def install
      system "pip3", "install", "--prefix=#{prefix}", "."
    end
  
    test do
      system bin/"ai-pre-commit", "--version"
    end
  end