module ApplicationHelper
  require "redcarpet"
  require "coderay"

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
        language = language.split(':')[0] if language.present?
    case language.to_s
      when 'rb'
          lang = 'ruby'
      when 'yml'
          lang = 'yaml'
      when 'css'
          lang = 'css'
      when 'html'
          lang = 'html'
      when ''
          lang = 'md'
      else
          lang = language
    end
      CodeRay.scan(code, lang).div
  end
    def list(text,type)
        %(<ol class="ol-markdown">#{text}</ol>)
    end

    def list_item(text, list_type)
        %(<li class="li-markdown">#{text}</li>)
    end

    def table(header, body)
        %(<table class="table-markdown"><thead class="thead-markdown"><tr class="tr-markdown">#{header}<tr></thead><tbody class="tbody-markdown">#{body}</tbody></table>)
    end
  end


  def markdown(text)
    return if text == nil
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true,  link_attributes: { rel: 'nofollow', target: "_blank" })
    options = {
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        xhtml: true,
        lax_html_blocks: true,
        strikethrough: true,
        underline: true,
        highlight: true,
        list: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end
end
