import VueRouter from 'vue-router';
import NewPost from './pages/newPost.vue';
import RankPage from './pages/rankingPage.vue';

const routes = [
	{path: '/',component: NewPost},
	{path: '/rankPage',component: RankPage}
];

export default new VueRouter({ routes });