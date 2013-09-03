#define STRINGIFY(x) #x

static const char fragmentShaderSrc[] = STRINGIFY(
    //basic precision for floats
    precision mediump float;
                      
    // local constant
    const float blurLevel = 1.0;
    
    // texture coordinate frpm vertex-shader
    varying vec2 v_TexCoord;
            
    // constant values sent from programm
    //uniform vec2 u_Scale;
    uniform sampler2D u_Texture0;
                                                  
    void main ()
    {        
        /* QUITE SLOW */
       // Access the nine pixels surrounding the current coordinate location.
       // We access the pixels in the following order assuming that the
       // current coordinate is located in the center of the matrix:
       //      1  4  7
       //      2  5  8
       //      3  6  9
       
       float denominator = 0.0;
       vec4 colorAccumulator = vec4(0.0, 0.0, 0.0, 1.0);
       
       for(float i=-(blurLevel); i<=blurLevel; i++)
       {
           for(float j=-(blurLevel); j<=blurLevel; j++)
           {
                //TODO: Problem figuring out the pixel-width and -height of the screen
               colorAccumulator += texture2D(u_Texture0, vec2(v_TexCoord.x + i / 1024.0, v_TexCoord.y + j / 768.0));
               denominator++;
           }
       }
       
       
       // calculate the resultant pixel value which is the accumulated color
       // divided by the total number of pixels.  
       // In this case, the denominator is 9.
       gl_FragColor = vec4(colorAccumulator / denominator);

    }
);