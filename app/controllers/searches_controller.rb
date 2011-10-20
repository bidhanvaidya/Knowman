class SearchesController < ApplicationController
def index
	@topics= Topic.search(params[:search]).where(:version => 'latest')
end

end
