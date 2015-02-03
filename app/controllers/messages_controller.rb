class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :send_email]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.order(:created_at).page(params[:page]).all
  end

  def scheduled_mails
    @messages = Message.where(processed: false, enqueued: true).order(:schedule_date).page params[:page]
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_email
    #ScheduleMail.perform_in(@message.schedule_date,@message)
    message_id = @message.id
    #ScheduleMail.perform_async(message_id)
    datetime = ActiveSupport::TimeZone[@message.time_zone].parse(@message.schedule_date)
    ScheduleMail.perform_in(datetime,message_id)
    @message.enqueued = true
    @message.save
    respond_to do |format|
      format.html { redirect_to scheduled_mails_messages_path, notice: 'Message is enqueued.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:schedule_date, :subject, :body, :time_zone, :receiver_tokens)
    end
end
