/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Rooms;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author Admin
 */
@AllArgsConstructor@NoArgsConstructor@Setter@Getter
public class Room {
    private int roomId;
    private RoomType roomType;
    private String picture;
    private String details;
    private long roomPrice;
    private int occupancyLimit;
}
