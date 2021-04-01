
class FriendPdf < Prawn::Document
    def initialize(friends)
        super()
        @friends = friends
        line_items
    end

    def line_items
        move_down 20
        text "First Name: "+"#{@friends.first_name}",size: 25, style: :bold
        text "Last Name: "+"#{@friends.last_name}",size: 25, style: :bold
        text "Email:"+"#{@friends.email}",size: 25, style: :bold
        text "Phone No: "+"#{@friends.phone}",size: 25, style: :bold
        text "Twitter: "+"#{@friends.twitter}",size: 25, style: :bold
    end


end