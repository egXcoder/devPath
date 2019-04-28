<template>
  <div class="collapsed-menu">
    <div onclick="toggleDrawer()" class="closeButton">
      <a>X</a>
    </div>
    <div class="menu-container">
      <ul class="list-unstyled">
        @foreach ($categories as $category)
        <li>
          <i class="fas fa-code text-white mr-2"></i>
          <a href="{{route('show',['categoryTitle'=>$category->name])}}">{{$category->name}}</a>
        </li>@endforeach
      </ul>
      <form id="logout-form" action="{{ route('logout') }}" method="POST">
        @csrf
        <button type="submit" class="btn btn-primary d-block mx-auto mt-5">Logout</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showDeleteBox: false,
      panels: []
    };
  },
  created() {
    this.fetchPanels();
  },
  components: {
    panel: require("./Panel").default
  },
  methods: {
    fetchPanels() {
      this.$http
        .get(
          document.location.origin +
            "/api/" +
            this.$shared.category_title +
            "/panels"
        )
        .then(response => {
          this.panels = response.body.data;
        });
    },
    addPanel() {
      this.$http.post(
        document.location.origin +
          "/api/" +
          this.$shared.category_title +
          "/panels/create",
        { api_token: this.$shared.api_token }
      );
      toast("panel Created Successfully");
      this.fetchPanels();
    },
    deletePanel(panel) {
      this.$http.delete(
        document.location.origin + "/api/panels/delete/" + panel.id,
        { api_token: this.$shared.api_token }
      );
      toast("panel Deleted Successfully");
      this.fetchPanels();
    },
    editPanel(panel) {
      console.log(panel.id);
      this.$http.put(document.location.origin + "/api/panels/edit/" + panel.id, {
        name: event.target.innerText,
        api_token: this.$shared.api_token
      });
      toast("panel updated Successfully");
    }
  }
};
</script>