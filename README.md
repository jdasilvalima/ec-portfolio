# ecportfolio

![Nuxt.js](https://img.shields.io/badge/Nuxt.js-35495E?style=for-the-badge&logo=vue.js&logoColor=4FC08D)

![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/jdasilvalima/ec-portfolio?style=for-the-badge)
[![GitHub last commit](https://img.shields.io/github/last-commit/jdasilvalima/ec-portfolio?style=for-the-badge)](https://github.com/jdasilvalima/ec-portfolio/commits)

## I. PROJECT DESCRIPTION
### I.1 Introduction
**EcPortfolio** - is a website to showcase a photographer's work.

### I.2 Goals
The goal for this project was to create an interactive website while deepening my knowledge of modern frontend tools and techniques :

- Enhance frontend development skills using [Nuxt.js](https://nuxt.com/).
- Explore smooth scrolling techniques with [Lenis](https://lenis.darkroom.engineering/).
- Implement dynamic animations with [GSAP](https://gsap.com/) to create an engaging user experience.
- Get started with [WebGL](https://webgl2fundamentals.org/) and [Three.js](https://threejs.org/) to explore 3D web graphics

## II. PROJECT SETUP
### II.1 Requirements
- [Node.js](https://nodejs.org/en/) needs to be installed.
- A package manager, such as npm or yarn, is required.


### II.2 Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

**Type Support for `.vue` Imports in TS**

TypeScript cannot handle type information for `.vue` imports by default, so we replace the `tsc` CLI with `vue-tsc` for type checking. In editors, we need [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin) to make the TypeScript language service aware of `.vue` types.

If the standalone TypeScript plugin doesn't feel fast enough to you, Volar has also implemented a [Take Over Mode](https://github.com/johnsoncodehk/volar/discussions/471#discussioncomment-1361669) that is more performant. You can enable it by the following steps:

1. Disable the built-in TypeScript Extension
    1) Run `Extensions: Show Built-in Extensions` from VSCode's command palette
    2) Find `TypeScript and JavaScript Language Features`, right click and select `Disable (Workspace)`
2. Reload the VSCode window by running `Developer: Reload Window` from the command palette.

**Customize configuration**

See [Vite Configuration Reference](https://vitejs.dev/config/).

### II.3 Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Type-Check, Compile and Minify for Production

```sh
npm run build
```

### Lint with [ESLint](https://eslint.org/)

```sh
npm run lint
```

## III. APPLICATION ARCHITECTURE
The following schema illustrates how the components in the application are interconnected and their hierarchical relationships.

![FrontEnd Architecture](./readme-doc/fe-architecture.png)


## IV. REFERENCES
### IV.1 Mesh Gradiant
* [The Book of Shaders - Noise](https://thebookofshaders.com/11/)
* [Gradient Flow](https://www.shadertoy.com/view/wdyczG)
* [Whatamesh](https://whatamesh.vercel.app/)
* [Canva & EventListener](https://codepen.io/wiz_amit/pen/JjGRZjJ)
* [CSS Morphing Gradients Animated Background](https://www.youtube.com/watch?v=Ml-B-W91gtw&ab_channel=WeCoded)
* [UVcanvas](https://uvcanvas.com/)
* [Noise & Gradient](https://www.noiseandgradient.com/?chaos=0.2&colors=%23ed625d-%2342b6c6-%23f79f88-%23b2dfe6-%2303232d-%23ffffff&grain=0.15)

### IV.2 WebGL
* [Learn WebGL](https://learnwebgl.brown37.net/)
* [Shadertoy](https://www.shadertoy.com/)