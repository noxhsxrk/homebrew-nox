class AiPreCommit < Formula
    desc "A description of your project"
    homepage "https://github.com/noxhsxrk/ai-pre-commit"
    url "https://github.com/noxhsxrk/ai-pre-commit/archive/refs/tags/v1.0.1.tar.gz"
    sha256 "708b8e1f7879808ee893ad7ca22e65e0772c6ef1013e432d66c22cf62d68011b"
    license "MIT"
  
    depends_on "python@3.9"
  
    def install
      system "pip3", "install", "--prefix=#{prefix}", "." 
    end
  
    test do
      system bin/"ai-pre-commit", "--version" 
    end
  end