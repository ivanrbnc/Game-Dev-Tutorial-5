# Tutorial 3

## Latihan Mandiri
1. Cara implementasi mekanik *double jump*
    * Pembuatan variabel limitasi *double jump*, yaitu variabel yang menghitung jumlah lompatan yang telah dilakukan
        * `export (int) var max_jumps = 2`
        * `var jumps_remaining = max_jumps`
    * Kondisional yang memeriksa jumlah lompatan yang telah dilakukan Player.
        
        ```
        if is_on_floor():
            jumps_remaining = max_jumps
        if Input.is_action_just_pressed("ui_up") and jumps_remaining > 0:
            velocity.y = jump_speed
            jumps_remaining -= 1
        ```
2. Cara implementasi mekanik *crouch*. *scaling* bernilai satu adalah wujud normal, sedangkan nilai setengahnya akan mengecilkan wujudnya.
    * Pembuatan variabel acuan scaling ketika tombol *crouch* ditekan
        * `export (float) var crouch_scale = 0.5`
    * Kondisional yang mengaktivasi *crouch*
        
        ```
        if Input.is_action_pressed("ui_down"):
		    $Sprite.scale.y = crouch_scale
        else:
            $Sprite.scale.y = 1.0
        ```

## Version
* Godot : 3.5.3

## Author 
* Ivan Rabbani Cezeliano (2106701892)