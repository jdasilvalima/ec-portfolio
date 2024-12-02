<template>
    <div class="gradient-background">
      <canvas ref="glCanvas"></canvas>
      <p>Test</p>
    </div>
  </template>
  
  <script setup>
  import { onMounted, ref } from 'vue'
  
  const glCanvas = ref(null)
  
  onMounted(() => {
    initWebGL()
  })
  
  function initWebGL() {
    const canvas = glCanvas.value
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight
  
    const gl = canvas.getContext('webgl')
    if (!gl) {
      console.error('WebGL is not supported in this browser')
      return
    }
  
    setupWebGL(gl)
  }
  
  function setupWebGL(gl) {
    const vertexShader = createShader(gl, gl.VERTEX_SHADER, `
      attribute vec2 position;
      void main() {
        gl_Position = vec4(position, 0.0, 1.0);
      }
    `)
  
    const fragmentShader = createShader(gl, gl.FRAGMENT_SHADER, `
      #define S(a,b,t) smoothstep(a,b,t)
      mat2 Rot(float a) {
        float s = sin(a);
        float c = cos(a);
        return mat2(c, -s, s, c);
      }
      vec2 hash(vec2 p) {
        p = vec2(dot(p, vec2(2127.1, 81.17)), dot(p, vec2(1269.5, 283.37)));
        return fract(sin(p) * 43758.5453);
      }
      float noise(in vec2 p) {
        vec2 i = floor(p);
        vec2 f = fract(p);
        vec2 u = f * f * (3.0 - 2.0 * f);
        float n = mix(mix(dot(-1.0 + 2.0 * hash(i + vec2(0.0, 0.0)), f - vec2(0.0, 0.0)),
                         dot(-1.0 + 2.0 * hash(i + vec2(1.0, 0.0)), f - vec2(1.0, 0.0)), u.x),
                     mix(dot(-1.0 + 2.0 * hash(i + vec2(0.0, 1.0)), f - vec2(0.0, 1.0)),
                         dot(-1.0 + 2.0 * hash(i + vec2(1.0, 1.0)), f - vec2(1.0, 1.0)), u.x), u.y);
        return 0.5 + 0.5 * n;
      }
      void main() {
        vec2 uv = gl_FragCoord.xy / vec2(${window.innerWidth}, ${window.innerHeight});
        float ratio = ${window.innerWidth} / ${window.innerHeight};
        vec2 tuv = uv;
        tuv -= 0.5;
        float degree = noise(vec2(iTime * 0.1, tuv.x * tuv.y));
        tuv.y *= 1.0 / ratio;
        tuv *= Rot(radians((degree - 0.5) * 720.0 + 180.0));
        tuv.y *= ratio;
        float frequency = 5.0;
        float amplitude = 80.0;
        float speed = iTime * 0.2;
        tuv.x += sin(tuv.y * frequency + speed) / amplitude;
        tuv.y += sin(tuv.x * frequency * 1.5 + speed) / (amplitude * 0.5);
        vec3 colorWhite = vec3(1.0, 1.0, 1.0);
        vec3 colorDeepBlue = vec3(0.192, 0.384, 0.933);
        vec3 layer1 = mix(colorWhite, colorDeepBlue, S(-0.2, 0.9, (tuv * Rot(radians(-5.0))).x));
        vec3 colorBlue = vec3(0.192, 0.384, 0.933);
        vec3 white = vec3(1.0, 1.0, 1.0);
        vec3 layer2 = mix(colorBlue, white, S(-0.9, 0.1, (tuv * Rot(radians(-5.0))).x));
        vec3 finalComp = mix(layer1, layer2, S(0.5, -0.3, tuv.y));
        gl_FragColor = vec4(finalComp, 1.0);
      }
    `)
  
    // Create and link the program
    const program = gl.createProgram()
    gl.attachShader(program, vertexShader)
    gl.attachShader(program, fragmentShader)
    gl.linkProgram(program)
  
    // Set up the vertex data
    const vertexData = new Float32Array([-1, 1, 1, 1, 1, -1, -1, -1])
    const vertexBuffer = gl.createBuffer()
    gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer)
    gl.bufferData(gl.ARRAY_BUFFER, vertexData, gl.STATIC_DRAW)
  
    // Get the location of the position attribute
    const positionLocation = gl.getAttribLocation(program, 'position')
    gl.enableVertexAttribArray(positionLocation)
    gl.vertexAttribPointer(positionLocation, 2, gl.FLOAT, false, 0, 0)
  
    // Render the gradient
    gl.useProgram(program)
    gl.drawArrays(gl.TRIANGLE_FAN, 0, 4)
  }
  
  function createShader(gl, type, source) {
    const shader = gl.createShader(type)
    gl.shaderSource(shader, source)
    gl.compileShader(shader)
    return shader
  }
  </script>
  
  <style scoped>
  .gradient-background {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
  }
  </style>