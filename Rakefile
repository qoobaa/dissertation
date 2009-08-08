require "rake/clean"

task :default => [:evince]

SRC = "praca.tex"
BIB_SRC = "praca.bib"
RUBY_SRC = FileList["*.rb"]
SVG_IMG =  FileList["*.svg"]

CLEAN.include(%w(*.toc *.aux *.log *.lof *.bbl *.blg *.out *.snm *.vrb *.nav),
              RUBY_SRC.ext("tex"),
              HTML_SRC.ext("tex"),
              SVG_IMG.ext("png"),
              ERB_SRC.ext("tex"))

CLOBBER.include(%w(pdf dvi ps).collect { |e| SRC.ext(e) })

def pdflatex(source)
  sh "pdflatex -interaction=nonstopmode #{source}"
end

rule ".png" => ".svg" do |t|
  sh "inkscape -e #{t.name} #{t.source}"
end

rule ".tex" => ".rb" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".tex" => ".rhtml" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".tex" => ".html" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".pdf" => ".tex" do |t|
  pdflatex(t.source)
end

file SRC.ext("pdf") => [SRC] + RUBY_SRC.ext("tex") + HTML_SRC.ext("tex") + SVG_IMG.ext("png") + ERB_SRC.ext("tex")

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