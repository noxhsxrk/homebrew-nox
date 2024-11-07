class AiPreCommit < Formula
    desc "A description of your project"
    homepage "https://github.com/noxhsxrk/ai-pre-commit"
    url "https://github.com/noxhsxrk/ai-pre-commit/archive/refs/tags/v1.0.2.tar.gz"
    sha256 "dafc886b4adeffea26742504a2f4e81ff1d54831ad5d917514a154eb3a5feba5"
    license "MIT"
  
    depends_on "python@3.9"
  
    def install
      system "pip3", "install", "--prefix=#{prefix}", "." 
    end
  
    test do
      system bin/"ai-pre-commit", "--version" 
    end
  end