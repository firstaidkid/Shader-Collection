#define STRINGIFY(x) #x

static const char vertexShaderSrc[] = STRINGIFY(
    // Input
    attribute vec4 vertexPosition;
    attribute vec2 vertexTexCoord;
    
    // External
    uniform mat4 projectionMatrix;
    
    // Pass to fragment shader
    varying vec2 v_TexCoord;

    void main()
    {
        gl_Position = projectionMatrix * vertexPosition;
        v_TexCoord = vertexTexCoord;
    }
);
