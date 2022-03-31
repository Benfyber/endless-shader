uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 vUv;
varying float vElevation;

void main() {
    vec4 textureColor = texture2D(uTexture, vUv);
    textureColor.rgb *= vElevation * 2.0 + 0.65;
    gl_FragColor = textureColor;
    // gl_FragColor = vec4(vUv, 1.0, 1.0);

    float barX = step(0.8, mod(vUv.x * 40.0 - 0.05, 1.0)) * step(0.9, mod(vUv.y * 40.0, 1.0));
    float barY = step(0.9, mod(vUv.x * 40.0, 1.0)) * step(0.8, mod(vUv.y * 40.0 - 0.05, 1.0));
    float strength = barX + barY;

    //float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    //strength *= step(0.8, mod(vUv.y * 10.0, 1.0));
    gl_FragColor = vec4(vec3(strength), .5);
}