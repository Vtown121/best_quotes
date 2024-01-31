# best_quotes/app/controllers/quotes_controller.rb

class QuotesController < Rulers::Controller
  def index
    quotes = Rulers::Model::FileModel.all
    render :index, :quotes => quotes
  end

  def a_quote
    render :a_quote, :noun => :winking
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end

  def show  # change the last line
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, :obj => quote,
      :ua => ua 
  end
end
