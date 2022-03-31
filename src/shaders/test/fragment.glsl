uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 vUv;
varying float vElevation;

void main() {
    vec4 textureColor = texture2D(uTexture, vUv);
    textureColor.rgb *= vElevation * 2.0 + 0.65;
    gl_FragColor = textureColor;
    // gl_FragColor = vec4(vUv, 1.0, 1.0);

    float barX = step(0.8, mod(vUv.x * 50.0 - 0.05, 1.0)) * step(0.9, mod(vUv.y * 50.0, 1.0));
    float barY = step(0.9, mod(vUv.x * 50.0, 1.0)) * step(0.8, mod(vUv.y * 50.0 - 0.05, 1.0));

    float strength = step(0.995, (mod(vUv.x * 50.0 + 0.05, 1.0) + 0.02));
    strength += step(0.995, (mod(vUv.y * 50.0 + 0.05, 1.0) + 0.02));
    strength += barX + barY;

    float alpha = 1.0 - 2.0 * (distance(vUv, vec2(0.5)));
    //float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    //strength *= step(0.8, mod(vUv.y * 10.0, 1.0));
    gl_FragColor = vec4(vec3(strength), alpha);
}