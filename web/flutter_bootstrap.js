{{flutter_js}}
{{flutter_build_config}}

const loading = document.getElementById('loading');
document.body.appendChild(loading);
loading.textContent = "Preparando...";
_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    loading.textContent = "Carregando...";
    const appRunner = await engineInitializer.initializeEngine();

    loading.textContent = "Pronto";
    await appRunner.runApp();

    removeSplashFromWeb();
  }
});

function removeSplashFromWeb() {
  loading?.remove()
  document.getElementById('splash-branding')?.remove()
  document.body.style.background = 'transparent'
}