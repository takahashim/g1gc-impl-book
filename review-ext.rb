# -*- coding: utf-8 -*-

module ReVIEW

  module LaTeXUtils
    def escape_latex(str)
      str.gsub(METACHARS_RE) {|s|
        MATACHARS[s] or raise "unknown trans char: #{s}"
      }.gsub(/ /,' ')
    end
  end

  class LATEXBuilder

    def source(lines, caption)
      puts '\begin{reviewsource}'
      source_header caption
      source_body lines
      puts '\end{reviewsource}'
      puts ""
    end

    def source_header(caption)
      puts macro('reviewsourcecaption', compile_inline(caption))
    end

    def source_body(lines)
      puts '\begin{reviewsourcebody}'
      lines.each do |line|
        puts detab(line)
      end
      puts '\end{reviewsourcebody}'
    end

  end

end
