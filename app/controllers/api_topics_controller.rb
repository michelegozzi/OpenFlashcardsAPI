class ApiTopicsController < BaseApiController

  before_filter :find_topic, only: [:show, :update]

  before_filter only: :create do
    unless @json.has_key?('topic') && @json['topic'].responds_to?(:[]) && @json['topic']['name']
      render nothing: true, status: :bad_request
    end
  end

  before_filter only: :update do
    unless @json.has_key?('topic')
      render nothing: true, status: :bad_request
    end
  end

  before_filter only: :create do
    @topic = Topic.find_by_text(@json['topic']['name'])
  end

  def index
    #render json: Topic.where('owner_id = ?', @user.id)
    @topic = Topic.all
    logger.info "rendering json"
    render json: @topic , :root => 'topics' #, serializer: TopicSerializer, root: 'topics'
  end

  def show
    render json: @topic
  end

  def create
    if @topic.present?
      render nothing: true, status: :conflict
    else
      @topic = Topic.new
      @topic.assign_attributes(@json['topic'])
      if @topic.save
        render json: @topic
      else
         render nothing: true, status: :bad_request
      end
    end
  end

  def update
    @topic.assign_attributes(@json['topic'])
    if @topic.save
        render json: @topic
    else
        render nothing: true, status: :bad_request
    end
  end

 private
   def find_topic
     @topic = Topic.find_by_text(params[:name])
     #render nothing: true, status: :not_found unless @topic.present? && @topic.user == @user
     render nothing: true, status: :not_found unless @topic.present?
   end
 end