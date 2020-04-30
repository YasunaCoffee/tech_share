class Api::MarkdownController < ApplicationController
  def preview
    @content = view_context.markdown(mb_params[:content]).html_safe
    render json: { content: @content }
  end

  private

  def mb_params
    params.permit(:content)
  end

end
