class MessagesController < ApplicationController
    before_action :set_conversation

    def index
        @messages = @conversation.messages
        
        if @messages.length > 10
            @limit_display = true
            @messages = @messages[-10..-1]
        end
        
        if params[:m]
            @limit_display = false
            @messages = @conversation.messages
        end
        
        if @messages.last
            if @messages.last.user_id != current_user.id
                @messages.last.read = true
            end
        end
        
        @message = @conversation.messages.new
    end
    
    def new
        @message = @conversation.messages.new
    end

    def create
        @message = @conversation.messages.new(message_params)
        if @message.save
            redirect_to conversation_messages_path(@conversation)
        end
    end

    private

    def set_conversation
        @conversation = Conversation.find(params[:conversation_id])
    end

    def message_params
        params.require(:message).permit(:body, :user_id)
    end
end