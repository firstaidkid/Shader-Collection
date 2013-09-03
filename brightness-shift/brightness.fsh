
#define STRINGIFY(x) #x

static const char fragmentShaderSrc[] = STRINGIFY(
    //basic precision for floats
    precision mediump float;
                      
    // local constant
    const float blurLevel = 2.0;
    
    // texture coordinate frpm vertex-shader
    varying vec2 v_TexCoord;
            
    // constant values sent from programm
    //uniform vec2 u_Scale;
    uniform sampler2D u_Texture0;
    uniform float u_adjustBrightness;
                                                  
    void main ()
    {
        // grab the camera-pixel
        vec3 incoming = texture2D(u_Texture0, v_TexCoord).rgb;
        
        // calculate the median-brightness of the 3 colors 
        vec3 colorOut= incoming + u_adjustBrightness;
        
        // set the final color for each pixel
        gl_FragColor.rgba = vec4(colorOut, 1.0);
    }
);