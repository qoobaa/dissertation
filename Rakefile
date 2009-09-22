require "rake/clean"

task :default => [:evince]

SRC = "praca.tex"
IMG_SRC = FileList["*.dia"]
RUBY_SRC = FileList["*.rb"]
HTML_SRC = FileList["*.html"]
SASS_SRC = FileList["*.sass"]
SVG_IMG =  FileList["*.svg"]
AGR_IMG =  FileList["*.agr"]
SH_SRC = FileList["*.sh"]

CLEAN.include(%w(*.toc *.aux *.log *.lof *.bbl *.blg *.out *.snm *.vrb *.nav *.eps),
              RUBY_SRC.ext("tex"),
              SVG_IMG.ext("png"),
              AGR_IMG.ext("ps"),
              AGR_IMG.ext("pdf"),
              HTML_SRC.ext("tex"),
              SH_SRC.ext("tex"),
              SASS_SRC.ext("tex"))

CLOBBER.include(%w(pdf dvi ps).collect { |e| SRC.ext(e) })

def pdflatex(source)
  sh "pdflatex -interaction=nonstopmode #{source}"
end

def bibtex(source)
  sh "bibtex #{source.ext("")}"
end

rule '.pdf' => '.eps' do |t|
  sh "epstopdf -outfile=#{t.name} #{t.source}"
end

rule '.pdf' => '.ps' do |t|
  sh "ps2pdf #{t.source} #{t.name}"
end

rule '.eps' => '.dia' do |t|
  sh "dia -e #{t.name} #{t.source}"
end

rule ".png" => ".svg" do |t|
  sh "inkscape -e #{t.name} #{t.source}"
end

rule ".tex" => ".rb" do |t|
  sh "pygmentize -f latex -O linenos=True -o #{t.name} #{t.source}"
end

rule ".tex" => ".html" do |t|
  sh "pygmentize -f latex -O linenos=True -o #{t.name} #{t.source}"
end

rule ".tex" => ".sass" do |t|
  sh "pygmentize -f latex -O linenos=True -o #{t.name} #{t.source}"
end

rule ".tex" => ".sh" do |t|
  sh "pygmentize -f latex -O linenos=True -o #{t.name} #{t.source}"
end

rule ".ps" => ".agr" do |t|
  sh "grace -hdevice PostScript -hardcopy #{t.source} -print #{t.name}"
end

rule ".pdf" => ".tex" do |t|
  pdflatex(t.source)
  bibtex(t.source)
  pdflatex(t.source)
  pdflatex(t.source)
end

file SRC.ext("pdf") => [SRC] + RUBY_SRC.ext("tex") + SVG_IMG.ext("png") + IMG_SRC.ext("pdf") + AGR_IMG.ext("pdf") + HTML_SRC.ext("tex") + SASS_SRC.ext("tex") + SH_SRC.ext("tex")

desc "Compile PDF"
task :pdf => SRC.ext("pdf")

desc "Show compiled PDF in Evince."
task :evince => :pdf do
  sh "evince #{SRC.ext("pdf")}"
end

desc "Debug compilation"
task :debug => [RUBY_SRC.ext("tex")] do |t|
  latex SRC
end
