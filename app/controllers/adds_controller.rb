class AddsController < ApplicationController
    
    def add
        @user = current_user
        @song = Song.find(params[:id])
        @exists = Add.find_by(user:@user, song:@song)
        if @exists
            @song.total_adds += 1
            @song.save
            @exists.amount += 1
            @exists.save
            redirect_to :back
        else
            @add = Add.new(user:@user, song:@song)
            if @add.valid?
                @song.total_adds += 1
                @song.save
                @add.amount += 1
                @add.save
                redirect_to :back
            else
                flash[:errors] = ['something went wrong']
                redirect_to :back
            end
        end
    end
end
    